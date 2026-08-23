export const sharedVars = [
    {
        path: '',
        side: 'shared',
        luaCode: `exports -- returns a table of resource names containing all export functions
resource -- returns a resource element of the resource the snippet was executed in
resourceRoot -- returns a resource root element of the resource the snippet was executed in
resourceName -- returns the name of the resource the snippet was executed in 
root -- returns the root element of the server`
    },
];

export const clientVars = [
    {
        path: '',
        side: 'client',
        luaCode: `guiRoot -- returns the root element of all GUI elements.
localPlayer -- returns the player element of the local player.`
    },
];

export const sharedEventVars = [
    {
        path: '',
        side: 'shared',
        luaCode: `source -- The player or element the event was attached to
this -- Element, which was attached function-handler.
eventName -- the name of the event ("onResourceStart", "onPlayerWasted" etc.)
sourceResource -- the resource that called the event
sourceResourceRoot -- the root of the resource that called the event`
    },
];

export const serverEventVars = [
    {
        path: '',
        side: 'server',
        luaCode: `client -- the client that called the event`
    },
];

export const sharedTimerVars = [
    {
        path: '',
        side: 'shared',
        luaCode: `sourceTimer -- current timer in callback function.`
    },
];