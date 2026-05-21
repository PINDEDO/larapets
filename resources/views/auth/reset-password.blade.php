{{-- <x-guest-layout>
    ...
</x-guest-layout> --}}
@extends('layouts.app')

@section('title', 'Larapets: Reset Password')
@section('content')
    @include('partials.navbar')

    <section class="card mt-4 w-full max-w-md border border-base-content/10 bg-base-100/95 shadow-2xl backdrop-blur-md">
        <div class="card-body">
            <header class="border-b border-base-content/15 pb-4">
                <h1 class="card-title text-2xl">
                    <i class="fa-solid fa-lock text-primary" aria-hidden="true"></i>
                    Nueva contraseña
                </h1>
                <p class="mt-2 text-sm text-base-content/70">Define una contraseña segura para tu cuenta.</p>
            </header>

            <form method="post" action="{{ route('password.store') }}" class="mt-6 flex flex-col gap-4">
                @csrf
                <input type="hidden" name="token" value="{{ $request->route('token') }}">

                <div class="form-control w-full">
                    <label class="label" for="email-reset"><span class="label-text font-medium">Correo</span></label>
                    <input id="email-reset" name="email" type="email" value="{{ old('email', $request->email) }}"
                        class="input input-bordered w-full @error('email') input-error @enderror"
                        autocomplete="username" required>
                    @error('email')
                        <span class="label-text-alt text-error">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-control w-full">
                    <label class="label" for="password-reset"><span class="label-text font-medium">Contraseña</span></label>
                    <input id="password-reset" name="password" type="password"
                        class="input input-bordered w-full @error('password') input-error @enderror"
                        placeholder="••••••••" autocomplete="new-password" required>
                    @error('password')
                        <span class="label-text-alt text-error">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-control w-full">
                    <label class="label" for="password_confirmation"><span class="label-text font-medium">Confirmar contraseña</span></label>
                    <input id="password_confirmation" name="password_confirmation" type="password"
                        class="input input-bordered w-full" placeholder="••••••••" autocomplete="new-password" required>
                    @error('password_confirmation')
                        <span class="label-text-alt text-error">{{ $message }}</span>
                    @enderror
                </div>

                <button type="submit" class="btn btn-primary w-full gap-2">
                    <i class="fa-solid fa-check" aria-hidden="true"></i>
                    Guardar contraseña
                </button>
            </form>
        </div>
    </section>
@endsection
