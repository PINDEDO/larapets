@extends('layouts.app')

@section('title', 'Larapets: Welcome')
@section('content')
    @include('partials.navbar')

    <article
        class="card mt-4 w-full max-w-md border border-base-content/10 bg-base-100/90 shadow-2xl backdrop-blur-md">
        <div class="card-body items-center gap-6 text-center">
            <figure class="w-full">
                <img src="{{ asset('images/login.jpeg') }}" alt="Larapets — adopción responsable"
                    class="mx-auto max-h-60 w-full max-w-xs rounded-2xl object-cover shadow-lg"
                    width="320" height="240">
            </figure>
            <div class="space-y-2">
                <h1 id="welcome-heading" class="text-2xl font-bold text-base-content">
                    Bienvenido a Larapets
                </h1>
                <p class="text-base-content/80">
                    Conectamos refugios con hogares responsables. Explora, compara y adopta con facilidad.
                    Tu próximo compañero puede estar a un clic.
                </p>
            </div>
            <div class="card-actions mt-2 flex w-full flex-wrap justify-center gap-3">
                @guest
                    <a class="btn btn-primary gap-2" href="{{ url('login') }}">
                        <i class="fa-solid fa-right-to-bracket" aria-hidden="true"></i>
                        Iniciar sesión
                    </a>
                    <a class="btn btn-outline btn-primary gap-2" href="{{ url('register') }}">
                        <i class="fa-solid fa-user-plus" aria-hidden="true"></i>
                        Registrarse
                    </a>
                @else
                    <a class="btn btn-primary gap-2" href="{{ url('dashboard') }}">
                        <i class="fa-solid fa-gauge-high" aria-hidden="true"></i>
                        Ir al panel
                    </a>
                @endguest
            </div>
        </div>
    </article>
@endsection
