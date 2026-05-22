FROM php:8.2-cli

# ── Dependencias del sistema ──────────────────────────────────────────────────
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# ── Extensiones PHP (incluye ext-gd requerida por maatwebsite/excel) ──────────
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo_mysql \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        zip \
        intl \
        dom \
        xml \
        fileinfo \
        ctype \
        tokenizer

# ── Node.js 20 (para compilar assets con Vite) ───────────────────────────────
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# ── Composer ──────────────────────────────────────────────────────────────────
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# ── Directorio de trabajo ─────────────────────────────────────────────────────
WORKDIR /var/www/html

# ── Copiar archivos del proyecto ──────────────────────────────────────────────
COPY . .

# ── Instalar dependencias PHP ─────────────────────────────────────────────────
RUN COMPOSER_ALLOW_SUPERUSER=1 composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction

# ── Instalar dependencias Node y compilar assets ──────────────────────────────
RUN npm ci && npm run build

# ── Permisos de Laravel ───────────────────────────────────────────────────────
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# ── Puerto expuesto ───────────────────────────────────────────────────────────
EXPOSE 8000

# ── Comando de inicio ─────────────────────────────────────────────────────────
CMD php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache \
    && php artisan migrate --force \
    && php artisan serve --host=0.0.0.0 --port=${PORT:-8000}
