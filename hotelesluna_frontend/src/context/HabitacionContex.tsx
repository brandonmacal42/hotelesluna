import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import axios from "axios";
import type { Habitacion } from "../api/models/habitacion";

interface HabitacionContextType {
  individuales: Habitacion[];
  dobles: Habitacion[];
  cuadruples: Habitacion[];
  penthouses: Habitacion[];
}

const HabitacionContext = createContext<HabitacionContextType>({
  individuales: [],
  dobles: [],
  cuadruples: [],
  penthouses: [],
});

export const useHabitacionContext = () => useContext(HabitacionContext);

export const HabitacionProvider = ({ children }: { children: ReactNode }) => {
  const [individuales, setIndividuales] = useState<Habitacion[]>([]);
  const [dobles, setDobles] = useState<Habitacion[]>([]);
  const [cuadruples, setCuadruples] = useState<Habitacion[]>([]);
  const [penthouses, setPenthouses] = useState<Habitacion[]>([]);

  useEffect(() => {
    axios
      .get("http://localhost:8000/api/habitaciones/individuales")
      .then((res) => setIndividuales(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/habitaciones/dobles")
      .then((res) => setDobles(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/habitaciones/cuadruples")
      .then((res) => setCuadruples(res.data))
      .catch((err) => console.error(err));

    axios
      .get("http://localhost:8000/api/habitaciones/penthouses")
      .then((res) => setPenthouses(res.data))
      .catch((err) => console.error(err));
  }, []);

  return (
    <HabitacionContext.Provider
      value={{ individuales, dobles, cuadruples, penthouses }}
    >
      {children}
    </HabitacionContext.Provider>
  );
};
