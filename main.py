# import the pygame module, so you can use it
import pygame
from player import Player
from score import Score

# define a main function
def main():
    
  # initialize the pygame module
  pygame.init()
  # load and set the logo
  # logo = pygame.image.load("logo32x32.png")
  # pygame.display.set_icon(logo)
  pygame.display.set_caption("Awesome Dungeons")
  
  # create a surface on screen that has the size of 240 x 180
  screen = pygame.display.set_mode((800, 600), pygame.RESIZABLE + pygame.SCALED)
  display = pygame.Surface((300, 200))

  aspect_ratio = 4 / 3

  # define a variable to control the main loop
  running = True

  clock = pygame.time.Clock()
  score = Score()

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

    width = display.get_width()
    height = display.get_height()

    pygame.draw.rect(
        display,
        "blue",
        [0, 0, width, height / 2]
    )

    rows = int(height / 2)
    for i in range(0, rows):
      y = height / 2 + i
      perspective = i / rows
      pygame.draw.rect(
          display,
          "green",
          [0, y, width, y]
      )
      road_width = width * (0.1 + perspective * 0.8)
      side_width = (width - road_width) / 2
      pygame.draw.rect(
          display,
          "gray",
          [side_width, y, road_width, y]
      )

    if screen.get_height() > screen.get_width() / aspect_ratio:
      screen.blit(pygame.transform.scale(display, (screen.get_width(), int(screen.get_width() / aspect_ratio))), (0, 0))
    else:
      screen.blit(pygame.transform.scale(display, (int(screen.get_height() * aspect_ratio), screen.get_height())), (0, 0))
    pygame.display.flip()

    # Score
    if keys[pygame.K_p]: # You will score when pressing P
        score.add_to_score(1)
    score.show_score(screen)
    pygame.display.flip()

# run the main function only if this module is executed as the main script
# (if you import this as a module then nothing is executed)
if __name__=="__main__":
  # call the main function
  main()
