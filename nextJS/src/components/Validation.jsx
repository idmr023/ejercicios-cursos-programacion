import * as Yup from 'yup';

export const validationSchema = Yup.object().shape({
    title: Yup.string()
        .min(5, 'Título muy corto')
        .max(25, 'Título muy largo')
        .required('Campo título requerido'),
    price: Yup.number()
        .typeError('El campo precio debe ser un número')
        .positive(1, 'El precio no puede ser un número negativo')
        .integer('Debe ser un número entero o tener la cantidad de decimales permitida'),
    category: Yup.string()
        .min(3, 'Nombre de categoría muy corto')
        .max(12, 'Nombre de categoría muy largo')
        .required('Campo categoría requerido'),
    description: Yup.string()
        .min(3)
        .max(180)
        .required('Campo descripción no puedo estar vacío'),
    images: Yup.array().of(Yup.string()), 
}) 