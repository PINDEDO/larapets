{{-- <x-guest-layout>
    ...
</x-guest-layout> --}}

@extends('layouts.app')

@section('title', 'Larapets: Forgot-Password')
@section('content')
    @include('partials.navbar')

    <section class="card mt-4 w-full max-w-md border border-base-content/10 bg-base-100/95 shadow-2xl backdrop-blur-md">
        <div class="card-body">
            <header class="border-b border-base-content/15 pb-4">
                <h1 class="card-title text-2xl">
                    <i class="fa-solid fa-key text-primary" aria-hidden="true"></i>
                    Recuperar contraseña
                </h1>
                <p class="mt-2 text-sm text-base-content/70">
                    Indica tu correo y te enviaremos un enlace para elegir una nueva contraseña.
                </p>
            </header>

            <form method="post" action="{{ route('password.email') }}" class="mt-6 flex flex-col gap-4">
                @csrf
                <div class="form-control w-full">
                    <label class="label" for="email-forgot"><span class="label-text font-medium">Correo</span></label>
                    <input id="email-forgot" name="email" type="email" value="{{ old('email') }}"
                        class="input input-bordered w-full @error('email') input-error @enderror"
                        placeholder="correo@ejemplo.com" autocomplete="email" required>
                    @error('email')
                        <span class="label-text-alt text-error">{{ $message }}</span>
                    @enderror
                </div>
                <button type="submit" class="btn btn-primary w-full gap-2">
                    <i class="fa-solid fa-paper-plane" aria-hidden="true"></i>
                    Enviar enlace
                </button>
            </form>
        </div>
    </section>
@endsection
