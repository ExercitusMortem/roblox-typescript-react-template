import React, { useEffect, useRef, useState } from "@rbxts/react";

export function useHover() {
    const Ref = useRef<GuiObject | undefined>(undefined)

    const [hovering, setHovering] = useState(false);

    const onHover = () => {
        setHovering(true)
    }
    const onLeave = () => {
        setHovering(false)
    }
    useEffect(() => {
        const cur = Ref.current as GuiObject
        if (cur) {
            const enter = cur.MouseEnter.Connect((x, y) => {
                onHover()
            })
            const leave = cur.MouseLeave.Connect(() => {
                onLeave()
            })
            return () => {
                enter.Disconnect()
                leave.Disconnect()
            }
        }
    }, [Ref.current])

    return {
        Ref,
        event: {
            MouseEnter: onHover,
            MouseLeave: onLeave,
        }
    }
}
