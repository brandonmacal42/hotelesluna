import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import axios from "axios";
import type { Huesped } from "../api/models/huesped";

interface HuespedContextType {
  huespedes: Huesped[];
}

const HuespedContext = createContext<HuespedContextType>({ huespedes: [] });

export const useHuespedContext = () => useContext(HuespedContext);

export const HuespedProvider = ({ children }: { children: ReactNode }) => {
  const [huespedes, setHuespedes] = useState<Huesped[]>([]);

  useEffect(() => {
    axios
      .get("http://localhost:8000/api/huespedes")
      .then((res) => setHuespedes(res.data))
      .catch((err) => console.error(err));
  }, []);

  return (
    <HuespedContext.Provider value={{ huespedes }}>
      {children}
    </HuespedContext.Provider>
  );
};
