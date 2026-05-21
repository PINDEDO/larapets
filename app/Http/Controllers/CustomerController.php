<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Adoption;

class CustomerController extends Controller
{
    public function myprofile(){
        $user = User::find(Auth::User()->id);
        return view('customer.myprofile')->with('user', $user);
    }

    public function updatemyprofile(Request $request, User $user)
    {
        // Convertir email a minúsculas antes de todo
        $email = strtolower($request->email);

        // Validar que el usuario autenticado solo pueda editar su propio perfil
        if ($user->id !== Auth::user()->id) {
            return redirect()->back()->with('error', 'You can only edit your own profile.');
        }

        $request->validate([
            'document' => ['required', 'numeric', 'unique:users,document,' . $user->id],
            'fullname' => ['required', 'string', 'max:255'],
            'gender'   => ['required', 'in:Female,Male'],
            'birthdate' => ['required', 'date'],
            'phone'    => ['required', 'string', 'max:20'],
            'email'    => ['required', 'string', 'email', 'max:255', 'unique:users,email,' . $user->id],
            'photo'    => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'],
            'active'   => ['required', 'in:0,1'],
            'role'     => ['required', 'in:Customer,Admin,Moderator'],
        ]);

        // Actualizar los datos del usuario
        $user->document = $request->document;
        $user->fullname = $request->fullname;
        $user->gender = $request->gender;
        $user->birthdate = $request->birthdate;
        $user->phone = $request->phone;
        $user->active = $request->active;
        $user->role = $request->role;
        $user->email = $email;

        // Manejar la foto
        if ($request->hasFile('photo')) {
            // Eliminar foto anterior si no es la default
            if ($user->photo && $user->photo != 'default.jpg') {
                $oldPhotoPath = public_path('images/' . $user->photo);
                if (file_exists($oldPhotoPath)) {
                    unlink($oldPhotoPath);
                }
            }

            $photoName = time() . '.' . $request->photo->extension();
            $request->photo->move(public_path('images'), $photoName);
            $user->photo = $photoName;
        }

        if ($user->save()) {
            return redirect('dashboard')->with('success', 'The User: ' . $user->fullname . ' was edited successfully!');
        }

        return back()->with('error', 'Error updating user');
    }

    public function myadoptions()
{
    // Lógica para mostrar adopciones del usuario
    $adoptions = Adoption::where('user_id', Auth::user()->id)
        ->with(['user', 'pet'])
        ->orderBy('id', 'desc')
        ->paginate(10); // ← IMPORTANTE: usa paginate(), no get()

    return view('customer.myadoptions', compact('adoptions'));
}

    public function showadoption(Request $request)
    {
        $adoption = Adoption::find($request->id);
        // dd($adoption->toArray());
        return view('customer.showmyadoption')->with('adoption', $adoption);
    }

    public function listpets()
    {
        // Lógica para listar mascotas
        return view('customer.listpets');
    }

    public function search(Request $request)
    {
        $q = $request->input('q');
        $pets = \App\Models\Pet::where('name', 'LIKE', '%' . $q . '%')
            ->orWhere('species', 'LIKE', '%' . $q . '%')
            ->orWhere('breed', 'LIKE', '%' . $q . '%')
            ->orWhere('location', 'LIKE', '%' . $q . '%')
            ->get();
        // Lógica para buscar mascotas para adopción
        return view('customer.searchpets', compact('pets'));
    }

    public function showpet($id)
    {
        // Lógica para mostrar una mascota específica
        return view('customer.showpet');
    }

    public function makeadoption(Request $request)
    {
        // Lógica para realizar una adopción
        return redirect()->back()->with('message', 'Adoption request sent successfully!');
    }
}
