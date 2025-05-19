import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import axios from "axios";
import type { Empleado } from "../api/models/empleado";

interface EmpleadoContextType {
  recepcionistas: Empleado[];
  apoyos: Empleado[];
  limpiezas: Empleado[];
  comidas: Empleado[];
}

const EmpleadoContext = createContext<EmpleadoContextType>({
  recepcionistas: [],
  apoyos: [],
  limpiezas: [],
  comidas: [],
});

export const useEmpleadoContext = () => useContext(EmpleadoContext);

export const EmpleadoProvider = ({ children }: { children: ReactNode }) => {
  const [recepcionistas, setRecepcionistas] = useState<Empleado[]>([]);
  const [apoyos, setApoyos] = useState<Empleado[]>([]);
  const [limpiezas, setLimpiezas] = useState<Empleado[]>([]);
  const [comidas, setComidas] = useState<Empleado[]>([]);
  useEffect(() => {
    axios
      .get("http://localhost:8000/api/recepcionistas")
      .then((res) => setRecepcionistas(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/apoyos")
      .then((res) => setApoyos(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/limpiezas")
      .then((res) => setLimpiezas(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/comidas")
      .then((res) => setComidas(res.data))
      .catch((err) => console.error(err));
  }, []);

  return (
    <EmpleadoContext.Provider
      value={{ recepcionistas, apoyos, limpiezas, comidas }}
    >
      {children}
    </EmpleadoContext.Provider>
  );
};
