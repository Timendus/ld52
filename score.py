import pygame

class Score:
    def __init__(self):
        self.textX = 10
        self.textY = 10
        self.score_value = 0
        self.font = pygame.font.Font('freesansbold.ttf', 32)

    def add_to_score(self, value):
        self.score_value += value

    def show_score(self, screen):
        score = self.font.render("Score :" + str(self.score_value), True, (255,255,255))
        screen.blit(score, (self.textX, self.textY))
