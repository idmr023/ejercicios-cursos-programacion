# REACT

### Notas:

- La etiqueta **`<Link to="">`** en React simula el comportamiento de **`<a href="">`** sin realizar nuevas solicitudes al servidor.
- Se pueden identificar elementos a tráves de data attributes como data-"nombre"
- **`map`** crea un nuevo array a partir de otro, mientras que **`forEach`** (solo itera sobre un array).
- Los botones por defecto en React son de tipo submit.
- En el archivo **`public/index.html`**, se puede establecer la fuente en un href de un link.
- Al asignar un valor a un input desde un prop, es necesario manejar cómo el input reacciona a ese valor y quitarle esa responsabilidad al navegador.
- Al usar **`map`**, es esencial asignar una key única a los elementos generados.
- **`e.preventDefault()`** evita la recarga del formulario al ser enviado.
- Los fragments (**`<></>`**) en React devuelven elementos vacíos.
- El operador **`?.`** se utiliza para acceder de forma segura a propiedades de objetos anidados, evitando errores si alguna de las propiedades no está definida o es nula.

### Conceptos previos:

1. **Virtual DOM:** React utiliza el Virtual DOM, una copia en memoria del DOM del navegador. Esta copia se actualiza de manera rápida y eficiente, permitiendo realizar comparaciones (diff) con el DOM real para luego reconciliar y actualizar el UI de la manera más eficiente posible.
2. **Estado:** Los datos dentro de un componente se llaman estado. Estos pueden actualizarse mediante diferentes métodos y son fundamentales en React, ya que, su cambio provoca la actualización de los nodos del Virtual DOM, afectando a la interfaz de usuario.
3. **React Hooks:** Proporcionan una alternativa a la escritura de componentes con estado sin necesidad de usar clases. Los hooks permiten escribir componentes funcionales, lo que puede facilitar la comprensión de la aplicación sin reemplazar por completo el uso de clases.
4. **Prop Drilling:** es un fenómeno que ocurre al pasar datos a través de múltiples capas en el árbol de componentes React. Este problema se presenta al pasar props entre componentes hijos, nietos y bisnietos. La solución es utilizar context para evitar el Prop Drilling, permitiendo acceder directamente a los datos dentro de un componente a través del contexto, evitando la necesidad de pasar los datos a través de todas las capas del árbol de componentes.

### **Desestructuración**

```jsx
const Equipo = (props) ⇒ {
	const {colorPrimario} = props
}
```

### **SPA vs aplicación tradicional:**

- **Aplicación Tradicional:** Envía todo el contenido de la página en cada solicitud, lo que resulta en recargas completas de la página.
- **SPA (Single Page Application):** Solo envía los componentes que han sido actualizados, evitando recargas completas de la página. En una SPA, se realiza una única solicitud al servidor, que devuelve un archivo HTML; los componentes JavaScript son responsables de mostrar el contenido actualizado sin necesidad de recargar la página completa.

## Hooks

<aside>
📌 **useState**
Permite agregar y actualizar el estado en componentes funcionales.
Recibe un valor inicial y devuelve un array con dos elementos: el estado actual y una función para actualizarlo.

</aside>

<aside>
📌 **useContext**

- Permite acceder al contexto de React en componentes funcionales.
- Proporciona acceso al valor actual del contexto definido en un componente superior mediante el componente Context.Provider.
    
    [React-hooks-Context.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/cb3d3d33-43c5-4f61-8cdb-517afa125466/eab9a030-9fdc-485e-8751-4f085580aeb1/React-hooks-Context.pdf)
    
</aside>

<aside>
📌 **useRef**

Permite mantener una referencia mutable en componentes funcionales.
Útil para acceder directamente a un elemento del DOM o almacenar valores persistentes a través de re-renderizados.

</aside>

<aside>
📌 **useEffect**

- Permite ejecutar efectos secundarios en componentes funcionales, como llamadas a API, suscripciones a eventos o limpieza de recursos.
- Para mostrar y seguir cambios en el valor de un input, se utiliza useEffect.
- useEffect tiene un segundo parámetro, un "arreglo de dependencias", que especifica cuándo debe ejecutarse el efecto. useEffect se eejcuta cada vez que el componente es montado en el DOM (renderizado) o cada que cambias las dependencias del mismo.
- Recibe 2 argumentos código a ejecutar (una función) y un arreglo de dependencias (cada vez que cambie X estado ejecutarlo si no se coloca este argumeto useEffect se ejecutará continuamente. Y si lo dejamos vacío ( [] ) significa  que se ejecute una única vez)

```
import React, { useEffect } from 'react';
useEffect (() => { console.log('Holi'); }, []);
//En ese caso console.log es la función y [] es el arreglo de dependencias
```

</aside>

<aside>
📌 **useHistory**
Se utiliza para redireccionar en React.

</aside>

### ¿Cómo llamar a una API?