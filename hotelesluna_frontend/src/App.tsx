import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { HotelProvider } from "./context/HotelContext";
import { HuespedProvider } from "./context/HuespedContext";
import ListaRecepcionistas from "./pages/Empleados/listaRecepcionistas";
import ListaHoteles from "./pages/listaHoteles";
import ListaApoyos from "./pages/Empleados/listaApoyos";
import ListaLimpiezas from "./pages/Empleados/listaLimpiezas";
import ListaComidas from "./pages/Empleados/listaComidas";
import ListaIndividual from "./pages/Habitaciones/listaIndividual";
import ListaDoble from "./pages/Habitaciones/listaDoble";
import { HabitacionProvider } from "./context/HabitacionContex";

import ListaPenthouse from "./pages/Habitaciones/listaPenthouse";
import ListaHuespedes from "./pages/listaHuespedes";
import ListaRecibos from "./pages/listaRecibos";
import { Nav } from "./components/layout/Nav/nav";
import { Menu } from "./pages/menu";

function App() {
  return (
    <BrowserRouter>
      <div className="min-h-screen flex">
        <Nav />
        <main className="flex-1 p-8">
          <Routes>
            <Route
              path="/hoteles"
              element={
                <HotelProvider>
                  <ListaHoteles />
                </HotelProvider>
              }
            />
            <Route
              path="/huespedes"
              element={
                <HuespedProvider>
                  <ListaHuespedes />
                </HuespedProvider>
              }
            />
            <Route path="*" element={<Navigate to="/hoteles" />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;
