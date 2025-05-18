import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import axios from "axios";
import type { Recibo } from "../api/models/recibo";

interface ReciboContextType {
  Recibos: Recibo[];
}

const ReciboContext = createContext<ReciboContextType>({ Recibos: [] });

export const useReciboContext = () => useContext(ReciboContext);

export const ReciboProvider = ({ children }: { children: ReactNode }) => {
  const [Recibos, setRecibos] = useState<Recibo[]>([]);

  useEffect(() => {
    axios
      .get("http://localhost:8000/api/recibos")
      .then((res) => setRecibos(res.data))
      .catch((err) => console.error(err));
  }, []);

  return (
    <ReciboContext.Provider value={{ Recibos }}>
      {children}
    </ReciboContext.Provider>
  );
};
