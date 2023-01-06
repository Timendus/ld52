import pygame

class Player:
  def __init__(self):
    self.x = 400
    self.y = 300
    self.dx = 0
    self.dy = 0

  def userInput(self, up, down, left, right):
    if up and self.dy > -4:
      self.dy -= 1
    if down and self.dy < 4:
      self.dy += 1
    if left and self.dx > -4:
      self.dx -= 1
    if right and self.dx < 4:
      self.dx += 1
  
  def updatePos(self):
    self.x += self.dx
    self.y += self.dy
    if self.dx != 0:
      self.dx *= 0.9
    if self.dy != 0:
      self.dy *= 0.9
    if abs(self.dx) < 0.01:
      self.dx = 0
    if abs(self.dy) < 0.01:
      self.dy = 0

  def render(self, screen):
    a = 5
    # Update only player position
    pygame.draw.rect(
        screen,
        "blue",
        [self.x-a, self.y-a, 30+2*a, 30+2*a]
    )
    pygame.draw.rect(
        screen,
        (255, 255, 255),
        [self.x, self.y, 30, 30]
    )
    # Partial screen updates (provide one or more Rect's)
    pygame.display.update([self.x-a, self.y-a, 30+2*a, 30+2*a])
