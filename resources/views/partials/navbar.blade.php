<header
    class="navbar fixed top-0 z-50 min-h-14 border-b border-base-content/10 bg-base-300/90 px-2 text-base-content shadow-md backdrop-blur-md sm:px-4">
    <div class="navbar-start flex-1">
        <a href="{{ url('/') }}" class="btn btn-ghost gap-2 text-lg normal-case sm:text-xl"
            aria-label="Inicio Larapets">
            <i class="fa-solid fa-paw text-2xl text-primary" aria-hidden="true"></i>
            <span>Larapets</span>
        </a>
    </div>
    <nav class="navbar-end flex-none gap-2" aria-label="Navegación principal">
        @guest
            <ul class="menu menu-horizontal gap-0 px-1 sm:gap-1">
                <li>
                    <a href="{{ url('login') }}"
                        class="gap-2 rounded-btn {{ request()->is('login') ? 'bg-primary/25 pointer-events-none text-primary' : '' }}"
                        {{ request()->is('login') ? 'aria-current="page"' : '' }}>
                        <i class="fa-solid fa-right-to-bracket" aria-hidden="true"></i>
                        <span class="hidden sm:inline">Login</span>
                    </a>
                </li>
                <li>
                    <a href="{{ url('register') }}"
                        class="gap-2 rounded-btn {{ request()->is('register') ? 'bg-primary/25 pointer-events-none text-primary' : '' }}"
                        {{ request()->is('register') ? 'aria-current="page"' : '' }}>
                        <i class="fa-solid fa-user-plus" aria-hidden="true"></i>
                        <span class="hidden sm:inline">Register</span>
                    </a>
                </li>
            </ul>
        @else
            {{-- Fuera del menu-horizontal: evita overflow/recorte del panel desplegable --}}
            <div class="dropdown dropdown-end">
                <div tabindex="0" role="button"
                    class="btn btn-ghost max-w-[14rem] gap-2 px-2 normal-case"
                    aria-haspopup="menu"
                    aria-expanded="false"
                    aria-label="Menú de usuario">
                    <img src="{{ asset('images/' . Auth::user()->photo) }}" alt=""
                        class="h-10 w-10 shrink-0 rounded-full border-2 border-base-content/20 object-cover"
                        width="40" height="40">
                    <span class="truncate text-sm font-medium">{{ Auth::user()->fullname }}</span>
                </div>
                <ul tabindex="0"
                    class="dropdown-content menu z-[100] mt-2 w-56 rounded-box border border-base-content/10 bg-base-200 p-2 shadow-xl">
                    <li>
                        <a href="{{ url('dashboard') }}" class="gap-2">
                            <i class="fa-solid fa-gauge-high w-5 text-center" aria-hidden="true"></i>
                            Dashboard
                        </a>
                    </li>
                    @if (Auth::user()->role == 'Admin')
                        <li>
                            <a href="{{ url('users') }}" class="gap-2">
                                <i class="fa-solid fa-users w-5 text-center" aria-hidden="true"></i>
                                User Module
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('pets') }}" class="gap-2">
                                <i class="fa-solid fa-paw w-5 text-center" aria-hidden="true"></i>
                                Pets Module
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('adoptions') }}" class="gap-2">
                                <i class="fa-solid fa-heart w-5 text-center" aria-hidden="true"></i>
                                Adoption Module
                            </a>
                        </li>
                    @else
                        <li>
                            <a href="{{ url('myprofile') }}" class="gap-2">
                                <i class="fa-solid fa-id-card w-5 text-center" aria-hidden="true"></i>
                                My Profile
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('myadoptions') }}" class="gap-2">
                                <i class="fa-solid fa-heart w-5 text-center" aria-hidden="true"></i>
                                My Adoptions
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('listpets') }}" class="gap-2">
                                <i class="fa-solid fa-hand-holding-heart w-5 text-center"
                                    aria-hidden="true"></i>
                                Adopt a pet
                            </a>
                        </li>
                    @endif
                    <li>
                        <form method="POST" action="{{ url('logout') }}" class="w-full">
                            @csrf
                            <button type="submit"
                                class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-left text-sm hover:bg-base-300">
                                <i class="fa-solid fa-right-from-bracket w-5 text-center"
                                    aria-hidden="true"></i>
                                Log Out
                            </button>
                        </form>
                    </li>
                </ul>
            </div>
        @endguest
    </nav>
</header>
