@extends('layouts.app')

@section('title', 'Larapets: Register')
@section('content')
    @include('partials.navbar')

    <section class="card mt-4 w-full max-w-4xl border border-base-content/10 bg-base-100/95 shadow-2xl backdrop-blur-md">
        <div class="card-body">
            <header class="border-b border-base-content/15 pb-4">
                <h1 class="card-title text-2xl sm:text-3xl">
                    <i class="fa-solid fa-user-plus text-primary" aria-hidden="true"></i>
                    Crear cuenta
                </h1>
                <p class="mt-1 text-sm text-base-content/70">Completa tus datos para registrarte en Larapets.</p>
            </header>

            <form class="mt-6 flex flex-col gap-6 md:flex-row md:gap-8" method="POST" action="{{ route('register') }}"
                autocomplete="on">
                @csrf

                <div class="flex w-full flex-col gap-4 md:w-1/2">
                    <div class="form-control w-full">
                        <label class="label" for="document"><span class="label-text font-medium">Documento</span></label>
                        <input id="document" name="document" type="text" value="{{ old('document') }}"
                            class="input input-bordered w-full @error('document') input-error @enderror"
                            placeholder="75000011" inputmode="numeric">
                        @error('document')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="fullname"><span class="label-text font-medium">Nombre completo</span></label>
                        <input id="fullname" name="fullname" type="text" value="{{ old('fullname') }}"
                            class="input input-bordered w-full @error('fullname') input-error @enderror"
                            placeholder="Nombre y apellido" autocomplete="name">
                        @error('fullname')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="gender"><span class="label-text font-medium">Género</span></label>
                        <select id="gender" name="gender"
                            class="select select-bordered w-full @error('gender') select-error @enderror">
                            <option value="" disabled @selected(!old('gender'))>Seleccionar…</option>
                            <option value="Female" @selected(old('gender') == 'Female')>Femenino</option>
                            <option value="Male" @selected(old('gender') == 'Male')>Masculino</option>
                        </select>
                        @error('gender')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="birthdate"><span class="label-text font-medium">Fecha de nacimiento</span></label>
                        <input id="birthdate" name="birthdate" type="text" value="{{ old('birthdate') }}"
                            class="input input-bordered w-full @error('birthdate') input-error @enderror"
                            placeholder="AAAA-MM-DD" autocomplete="bday">
                        @error('birthdate')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="flex w-full flex-col gap-4 md:w-1/2">
                    <div class="form-control w-full">
                        <label class="label" for="phone"><span class="label-text font-medium">Teléfono</span></label>
                        <input id="phone" name="phone" type="text" value="{{ old('phone') }}"
                            class="input input-bordered w-full @error('phone') input-error @enderror"
                            placeholder="3001231234" autocomplete="tel">
                        @error('phone')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="email"><span class="label-text font-medium">Correo</span></label>
                        <input id="email" name="email" type="email" value="{{ old('email') }}"
                            class="input input-bordered w-full @error('email') input-error @enderror"
                            placeholder="correo@ejemplo.com" autocomplete="email">
                        @error('email')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="password"><span class="label-text font-medium">Contraseña</span></label>
                        <input id="password" name="password" type="password"
                            class="input input-bordered w-full @error('password') input-error @enderror"
                            placeholder="••••••••" autocomplete="new-password">
                        @error('password')
                            <span class="label-text-alt text-error">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-control w-full">
                        <label class="label" for="password_confirmation"><span class="label-text font-medium">Confirmar contraseña</span></label>
                        <input id="password_confirmation" name="password_confirmation" type="password"
                            class="input input-bordered w-full" placeholder="••••••••" autocomplete="new-password">
                    </div>

                    <button type="submit" class="btn btn-primary mt-2 w-full gap-2 md:mt-4">
                        <i class="fa-solid fa-user-plus" aria-hidden="true"></i>
                        Registrarse
                    </button>
                </div>
            </form>
        </div>
    </section>
@endsection
