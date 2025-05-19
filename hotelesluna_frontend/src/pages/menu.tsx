import React, { useEffect, useState } from "react";

import { Nav } from "../components/layout/Nav/nav";

export const Menu: React.FC = () => {
  return (
    <div className="max-h-screen flex">
      <Nav />
      <main className="flex-1 p-8">
        {/* Aquí puedes agregar el contenido principal del menú */}
        <h1 className="text-2xl font-bold mb-4">
          Bienvenido al sistema de hoteles
        </h1>
        {/* Puedes agregar más componentes aquí */}
      </main>
    </div>
  );
};
