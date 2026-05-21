{{-- <x-guest-layout>
    ...
</x-guest-layout> --}}

@extends('layouts.app')

@section('title', 'Larapets: Login')
@section('content')
    @include('partials.navbar')

    {{--
      Módulo proporción 2:1 (alto : ancho) → CSS aspect-ratio ancho/alto = 1/2 → altura = 2 × ancho
    --}}
    <section class="flex w-full justify-center px-4 pt-2" aria-labelledby="login-heading">
        <article
            class="mx-auto flex w-[min(100%,22rem,calc((100vh-7rem)/2))] flex-col overflow-hidden rounded-2xl border border-base-content/10 bg-base-100/95 shadow-2xl backdrop-blur-md aspect-[1/2]">

            <figure class="relative min-h-0 flex-[1_1_50%] overflow-hidden border-b border-base-content/10">
                <img src="{{ asset('images/login.jpeg') }}" alt=""
                    class="absolute inset-0 h-full w-full object-cover"
                    width="400" height="800">
            </figure>

            <div class="flex min-h-0 flex-[1_1_50%] flex-col overflow-y-auto px-4 pb-4 pt-3 sm:px-5">
                <header class="mb-3 shrink-0 border-b border-base-content/15 pb-3">
                    <h1 id="login-heading" class="flex items-center gap-2 text-xl font-semibold text-base-content sm:text-2xl">
                        <i class="fa-solid fa-right-to-bracket text-primary" aria-hidden="true"></i>
                        Iniciar sesión
                    </h1>
                    <p class="mt-1 text-xs text-base-content/70 sm:text-sm">Accede con tu correo y contraseña.</p>
                </header>

                <form class="flex min-h-0 flex-1 flex-col gap-3" action="{{ route('login') }}" method="POST"
                    autocomplete="on">
                    @csrf

                    <div class="form-control w-full shrink-0">
                        <label class="label py-1" for="email">
                            <span class="label-text text-sm font-medium"><i class="fa-solid fa-envelope mr-1 text-primary"
                                    aria-hidden="true"></i> Correo</span>
                        </label>
                        <input id="email" name="email" type="email" value="{{ old('email') }}"
                            class="input input-bordered input-sm w-full sm:input-md @error('email') input-error @enderror"
                            placeholder="usuario@correo.com" autocomplete="username" required>
                        @error('email')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full shrink-0">
                        <label class="label py-1" for="password">
                            <span class="label-text text-sm font-medium"><i class="fa-solid fa-key mr-1 text-primary"
                                    aria-hidden="true"></i> Contraseña</span>
                        </label>
                        <input id="password" name="password" type="password"
                            class="input input-bordered input-sm w-full sm:input-md @error('password') input-error @enderror"
                            placeholder="••••••••" autocomplete="current-password" required>
                        @error('password')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="mt-auto flex shrink-0 flex-col gap-2 pt-2">
                        <button type="submit" class="btn btn-primary btn-sm w-full gap-2 sm:btn-md">
                            <i class="fa-solid fa-arrow-right-to-bracket" aria-hidden="true"></i>
                            Entrar
                        </button>
                        @if (Route::has('password.request'))
                            <a class="btn btn-ghost btn-xs w-full gap-2 normal-case sm:btn-sm"
                                href="{{ route('password.request') }}">
                                <i class="fa-solid fa-circle-question" aria-hidden="true"></i>
                                ¿Olvidaste tu contraseña?
                            </a>
                        @endif
                    </div>
                </form>
            </div>
        </article>
    </section>
@endsection
