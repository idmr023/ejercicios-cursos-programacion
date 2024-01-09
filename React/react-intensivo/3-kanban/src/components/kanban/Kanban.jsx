import {DragDropContext, Draggable, Droppable} from "react-beautiful-dnd"
import mockData from "../../mockData"
import { Card } from "../card/Card"
import { useSate } from 'react'

export function Kanban(){
    const [data, setData]=useSate(mockData)
    const onDragEnd=(result)=>{
        if(!result.destination) return
        const {source, destination} = result
        if(!source.droppableId !==destination.droppableId) 
        {
            const sourceColIndex = data.findIndex(e => e.id === destination.droppableId)
            const destinationColIndex = data.findIndex(e => e.id === destination.droppableId)
            const sourceCol = data[sourceColIndex]
            const destinationCol = data[destinationColIndex]

            const sourceTask = [...sourceCol.tasks]
            const destinationTask = [...destinationCol.tasks]

            const [removed] = sourceTask.splice(source.index,1)
            destinationTask.splice(destination.index,0,0,removed)
            data[sourceColIndex].task=sourceTask
            data[destinationColIndex].task=destinationTask

            setData(data)
        }
    }   
    return(<DragDropContext onDragEnd={onDragEnd}>
        <div>
            {data.map((section)=>(
                <Droppable key={section.id} droppableId = {section.id}>

                </Droppable>
            ))}
        </div>
    </DragDropContext>
    );
}