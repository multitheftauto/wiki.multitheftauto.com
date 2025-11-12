-- Note: You have to wait 30 seconds before showing another tray notification, there is no queuing

createTrayNotification("Hello World") -- Show a 'Hello World' notification

createTrayNotification("Hello World", "warning") -- Show a notification with a warning symbol

createTrayNotification("Hello World", "default", false) -- Show a default notification without sound