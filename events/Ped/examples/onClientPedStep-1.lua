addEventHandler("onClientPedStep", localPlayer,
     function(leftFoot)
          if (leftFoot) then
               outputChatBox("Your left foot hit the ground.", 0, 255, 0)
          else
               outputChatBox("Your right foot hit the ground.", 0, 255, 0)
          end
     end
)