import { useHabitacionContext } from "../../context/HabitacionContex";
import ListaContainer from "../../components/layout/ListaContainer";

const ListaDoble = () => {
  const { dobles } = useHabitacionContext();

  return (
    <ListaContainer title="Habitaciones Dobles">
      <ul>
        {dobles.map((h) => (
          <li key={h.nohabitacion} className="border-b last:border-none py-2">
            <strong>Habitación #{h.nohabitacion}</strong>
            <br />
            Hotel: {h.idhotel} <br />
            Empleado Encargado: {h.idempleado} <br />
            Número de camas: {h.nocama} <br />
            Disponible: {h.disponible ? "Sí" : "No"} <br />
            Costo por noche: ${h.costonoche}
          </li>
        ))}
      </ul>
    </ListaContainer>
  );
};

export default ListaDoble;
