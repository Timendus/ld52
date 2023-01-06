# import the pygame module, so you can use it
import pygame
 
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
  player = [200, 200]
  keys = [False, False, False, False]

  def renderPlayer():
    # Update only player position
    pygame.draw.rect(
        screen,
        "blue",
        [player[0]-1, player[1]-1, 32, 32]
    )
    pygame.draw.rect(
        screen,
        (255, 255, 255),
        [player[0], player[1], 30, 30]
    )
    # Partial screen updates (provide one or more Rect's)
    pygame.display.update([player[0]-1, player[1]-1, 32, 32])

  # Initial screen draw
  screen.fill("blue")
  renderPlayer()
  # Full screen update
  pygame.display.flip()

  # main loop
  while running:

    # event handling, gets all event from the event queue
    for event in pygame.event.get():
      # only do something if the event is of type QUIT
      if event.type == pygame.QUIT:
        # change the value to False, to exit the main loop
        running = False
      if event.type == pygame.KEYDOWN:
        if event.key in [pygame.K_a, pygame.K_LEFT]:
          keys[0] = True
        if event.key in [pygame.K_d, pygame.K_RIGHT]:
          keys[1] = True
        if event.key in [pygame.K_w, pygame.K_UP]:
          keys[2] = True
        if event.key in [pygame.K_s, pygame.K_DOWN]:
          keys[3] = True
      if event.type == pygame.KEYUP:
        if event.key in [pygame.K_a, pygame.K_LEFT]:
          keys[0] = False
        if event.key in [pygame.K_d, pygame.K_RIGHT]:
          keys[1] = False
        if event.key in [pygame.K_w, pygame.K_UP]:
          keys[2] = False
        if event.key in [pygame.K_s, pygame.K_DOWN]:
          keys[3] = False

    # Update player position based on keys pressed
    player[0] +=  -1 if keys[0] else 0
    player[0] +=   1 if keys[1] else 0
    player[1] +=  -1 if keys[2] else 0
    player[1] +=   1 if keys[3] else 0
    renderPlayer()

# run the main function only if this module is executed as the main script
# (if you import this as a module then nothing is executed)
if __name__=="__main__":
  # call the main function
  main()
