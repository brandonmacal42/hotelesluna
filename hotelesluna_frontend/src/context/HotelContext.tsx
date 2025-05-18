import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import axios from "axios";
import type { Hotel } from "../api/models/hotel";

interface HotelContextType {
  hoteles: Hotel[];
}

const HotelContext = createContext<HotelContextType>({ hoteles: [] });

export const useHotelContext = () => useContext(HotelContext);

export const HotelProvider = ({ children }: { children: ReactNode }) => {
  const [hoteles, setHoteles] = useState<Hotel[]>([]);

  useEffect(() => {
    axios
      .get("http://localhost:8000/api/hoteles")
      .then((res) => setHoteles(res.data))
      .catch((err) => console.error(err));
  }, []);

  return (
    <HotelContext.Provider value={{ hoteles }}>
      {children}
    </HotelContext.Provider>
  );
};
