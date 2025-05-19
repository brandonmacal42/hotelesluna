import { useState } from "react";
import { useNavigate } from "react-router-dom";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHotel, faUserFriends } from "@fortawesome/free-solid-svg-icons";

const Nav = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const navigate = useNavigate();

  return (
    <nav className="fixed flex flex-col justify-between items-center bg-gray-800 text-white left-2 top-5 bottom-2 w-[15vw] h-[95vh] rounded-2xl p-4">
      <a
        href="#"
        className="mb-4 flex items-center space-x-2 hover:bg-gray-700 rounded-full px-4 py-2 transition"
      >
        <span className="text-2xl font-bold">CityLens</span>
      </a>
      <ul className="flex flex-col space-y-2 w-full mt-4">
        <li>
          <button
            onClick={() => navigate("/hoteles")}
            className="flex items-center gap-3 w-full px-4 py-3 rounded-full font-bold text-lg hover:bg-gray-700 transition"
          >
            <FontAwesomeIcon icon={faHotel} />
            Hoteles
          </button>
        </li>
        <li>
          <button
            onClick={() => navigate("/huespedes")}
            className="flex items-center gap-3 w-full px-4 py-3 rounded-full font-bold text-lg hover:bg-gray-700 transition"
          >
            <FontAwesomeIcon icon={faUserFriends} />
            Huéspedes
          </button>
        </li>
      </ul>
    </nav>
  );
};

export default Nav;
export { Nav };
