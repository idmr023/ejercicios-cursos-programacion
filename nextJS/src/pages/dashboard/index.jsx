import { useState } from "react";
import useFetch from "@hooks/useFetch";
import endPoints from "@services/api";
import Pagination from "./components/Pagination";
import { Chart } from "@common/Chart";

const PRODUCT_LIMIT = 5;
const PRODUCT_OFFSET = 5;

export default function Dashboard() {
    const [offset, setOffset] = useState(PRODUCT_OFFSET);

    const products = useFetch( endPoints.products.getProducts(PRODUCT_LIMIT, offset) );

    const categoryNames = products?.map((product) => product.category)
    const categoryCount = categoryNames?.map((category) => category.name)

    const countOcurrencies = (arr) => arr.reduce((prev, curr) => ((prev[curr] = ++ prev[curr] || 1), prev), {});    

    /*
        countOcurrences es una función que recibe un array.
        Esta función función devolverá el resultado de el método reduce aplicado al array.
        El método reduce utiliza dos parametros:
        prev: es el valor acumulado o previo de la reducción que estamos haciendo sobre el array. Este valor comienza siendo un objeto vacío, porque se lo hemos indicado como segundo argumento al metodo reduce (se ve al final de la linea).
        value: es el valor actual que estamos iterando del array.
        Por cada iteración, ejecutamos esta linea de código: (prev, value) => ((prev[value] = ++prev[value] || 1), prev). Esto es lo que hace este pedacito de codigo:
        Sobre el objeto que mencioné antes, declaramos una propiedad. Esta propiedad es el valor que estamos iterando (prev[value]). Si esta propiedad ya existía, le sumamos 1. Si no existía, le asignamos el valor inicial de 1.
        Por cada iteración, deberiamos devolver el objeto para volver a iterar sobre él en la próxima iteración. Pero, el pedacito de (prev[value] = ++prev[value] || 1) no devuelve el objeto, sino que devuelve el valor asignado a prev[value] (podría ser 1, 2, 3, etc.). No queremos eso.
        Para devolver el objeto, usamos la operador de coma de JavaScript, y sin importar todos los valores separados por comas, devolveremos el ultimo, en este caso, prev ( el objeto).
        RESUMEN: hicimos una operación, y despues devolvimos el objeto para operarlo otra vez. .
    */

    const data = {
        datasets: [
            {
                label: 'Categories',
                data: countOcurrencies(categoryCount),
                brorderWidth: 2,
                backgroundColor: ['#ffbb11', '#c0c0c0', '#50AF95', 'f3ba2f', '#2a71d0'],
            },
        ],
    };

    return (
    <>
        <Chart className="mb-8 mt-2" chartData={data}/>
        <div className="flex flex-col">
        <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
            <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                    <tr>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Name
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Category
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Price
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        ID
                    </th>
                    <th scope="col" className="relative px-6 py-3">
                        <span className="sr-only">Delete</span>
                    </th>
                    </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                    {products?.map((product) => (
                        <tr key={`Product-item-${product.id}`}>
                            <td className="px-6 py-4 whitespace-nowrap">
                                <div className="flex items-center">
                                    <div className="flex-shrink-0 h-10 w-10">
                                    <img className="h-10 w-10 rounded-full" src={product.images[0]} alt="" />
                                    </div>
                                    <div className="ml-4">
                                    <div className="text-sm font-medium text-gray-900">{product.title}</div>
                                    </div>
                                </div>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap">
                                <div className="text-sm text-gray-900">{product.category.name}</div>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap">
                                <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">{product.price}</span>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{product.id}</td>
                                <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="#" className="text-indigo-600 hover:text-indigo-900">
                                    Edit
                                </a>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="#" className="text-indigo-600 hover:text-indigo-900">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    ))}
                </tbody>
                </table>
            </div>
            </div>
        </div>
        <Pagination offset={offset} setOffset={setOffset} />
        </div>
    </>
    );
}