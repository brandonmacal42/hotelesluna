import { HotelProvider } from "./context/HotelContext";
import { HuespedProvider } from "./context/HuespedContext";
import { ReciboProvider } from "./context/ReciboContext";
import { EmpleadoProvider } from "./context/EmpleadoContext";
import ListaRecepcionistas from "./pages/Empleados/listaRecepcionistas";
import ListaHoteles from "./pages/listaHoteles";
import ListaApoyos from "./pages/Empleados/listaApoyos";

function App() {
  return (
    <EmpleadoProvider>
      <ListaApoyos />
    </EmpleadoProvider>
  );
}

export default App;
