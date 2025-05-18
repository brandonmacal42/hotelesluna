import type { ReactNode } from "react";

interface ListaContainerProps {
  title: string;
  children: ReactNode;
}

const ListaContainer = ({ title, children }: ListaContainerProps) => (
  <div className="min-h-screen bg-blue-100 flex flex-col items-center justify-center">
    <h1 className="text-4xl font-bold text-blue-900 mb-4">{title}</h1>
    <div className="bg-white rounded-lg p-4 shadow-md w-96">{children}</div>
  </div>
);

export default ListaContainer;
