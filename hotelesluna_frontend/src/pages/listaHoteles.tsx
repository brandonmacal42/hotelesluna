import { useHotelContext } from "../context/HotelContext";
import ListaContainer from "../components/layout/ListaContainer";

const ListaHoteles = () => {
  const { hoteles } = useHotelContext();

  return (
    <ListaContainer title="Lista de Hoteles">
      <ul>
        {hoteles.map((hotel) => (
          <li key={hotel.idhotel} className="border-b last:border-none py-2">
            <strong>{hotel.nombreestablecimiento}</strong> - {hotel.estado} -{" "}
            {hotel.colonia} -{" "}
            {hotel.petfriendly ? "Pet Friendly" : "No Pet Friendly"}
          </li>
        ))}
      </ul>
    </ListaContainer>
  );
};

export default ListaHoteles;
