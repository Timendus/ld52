# import the pygame module, so you can use it
import pygame
from player import Player

# define a main function
def main():
    
  # initialize the pygame module
  pygame.init()
  # load and set the logo
  # logo = pygame.image.load("logo32x32.png")
  # pygame.display.set_icon(logo)
  pygame.display.set_caption("Awesome Dungeons")
    
  # create a surface on screen that has the size of 240 x 180
  screen = pygame.display.set_mode((800, 600))

  # define a variable to control the main loop
  running = True

  # Player state
  player = Player()

  # Initial screen draw
  screen.fill("blue")
  player.render(screen)
  # Full screen update
  pygame.display.flip()

  clock = pygame.time.Clock()

  # main loop
  while running:
    clock.tick(60) # Run at 60FPS

    # event handling, gets all event from the event queue
    for event in pygame.event.get():
      # only do something if the event is of type QUIT
      if event.type == pygame.QUIT:
        # change the value to False, to exit the main loop
        running = False

    # Update player position based on keys pressed
    keys = pygame.key.get_pressed()
    player.userInput(
      keys[pygame.K_UP] or keys[pygame.K_w],
      keys[pygame.K_DOWN] or keys[pygame.K_s],
      keys[pygame.K_LEFT] or keys[pygame.K_a],
      keys[pygame.K_RIGHT] or keys[pygame.K_d]
    )
    player.updatePos()
    player.render(screen)

# run the main function only if this module is executed as the main script
# (if you import this as a module then nothing is executed)
if __name__=="__main__":
  # call the main function
  main()
