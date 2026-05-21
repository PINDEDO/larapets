<!DOCTYPE html>
<html lang="es" data-theme="dim">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <meta name="description" content="Larapets: adopción de mascotas y gestión de refugios.">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="relative min-h-dvh bg-base-300 text-base-content antialiased">
    {{-- Acceso rápido por teclado --}}
    <a href="#contenido-principal"
        class="fixed left-4 top-4 z-[60] -translate-y-24 rounded-btn bg-primary px-4 py-2 text-sm font-medium text-primary-content opacity-0 shadow-lg transition focus:translate-y-0 focus:opacity-100 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 focus:ring-offset-base-300">
        Saltar al contenido principal
    </a>

    {{-- Fondo: foto + velos neutros (sin tinte verde / sin color en overlay) --}}
    <div aria-hidden="true"
        class="pointer-events-none fixed inset-0 -z-20 bg-cover bg-center bg-no-repeat bg-fixed"
        style="background-image: url('{{ asset('images/background.png') }}');"></div>
    <div aria-hidden="true"
        class="pointer-events-none fixed inset-0 -z-10 bg-gradient-to-b from-neutral-950/85 via-neutral-900/55 to-neutral-950/35">
    </div>

    <main id="contenido-principal"
        class="relative z-0 mx-auto flex w-full max-w-7xl flex-1 flex-col items-center px-4 pb-12 pt-20 sm:px-6 lg:px-8">
        @yield('content')
    </main>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    @yield('js')
</body>

</html>
