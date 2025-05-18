import { useHuespedContext } from "../context/HuespedContext";
import ListaContainer from "../components/layout/ListaContainer";

const ListaHuespedes = () => {
  const { huespedes } = useHuespedContext();

  return (
    <ListaContainer title="Lista de Huéspedes">
      <ul>
        {huespedes.map((huesped) => (
          <li
            key={huesped.idhuesped}
            className="border-b last:border-none py-2"
          >
            <strong>
              {huesped.nombre} {huesped.apellidop} {huesped.apellidom}
            </strong>{" "}
            - {huesped.genero} - {huesped.nacionalidad} -{" "}
            {huesped.fechanacimiento
              ? new Date(huesped.fechanacimiento).toLocaleDateString()
              : "Sin fecha"}
          </li>
        ))}
      </ul>
    </ListaContainer>
  );
};

export default ListaHuespedes;
