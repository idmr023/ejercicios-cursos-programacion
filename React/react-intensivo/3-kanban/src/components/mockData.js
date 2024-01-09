import {v4 as uuidv4} from "uuid";

const mockData = [
    {
        id: uuidv4(),
        title: "Por hacer",
        tasks: [
            {
                id: uuidv4(),
                title: "Estudiar JS",
            },
            {
                id: uuidv4(),
                title: "Estudiar React",
            },
        ]
    },
    {
        id: uuidv4(),
        title: "Avanzada",
        tasks: [
            {
                id: uuidv4(),
                title: "Estudiar Inglés",
            },
            {
                id: uuidv4(),
                title: "Estudiar HTML y CSS",
            },
        ]
    },
    {
        id: uuidv4(),
        title: "Terminadas",
        tasks: [
            {
                id: uuidv4(),
                title: "Estudiar secundaria",
            },
            {
                id: uuidv4(),
                title: "Estudiar otros cursos",
            },
        ]
    }
];

export default mockData;