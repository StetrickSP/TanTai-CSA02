import pygame
import random
import sys

# Initialize Pygame
pygame.init()

# Constants
WINDOW_WIDTH, WINDOW_HEIGHT = 800, 600
CARD_WIDTH, CARD_HEIGHT = 100, 100
GRID_SIZE = 4  # 4x4 grid
FPS = 60

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
GREY = (200, 200, 200)
TEXT_COLOR = (0, 0, 0)

# Initialize fonts
pygame.font.init()
font = pygame.font.SysFont(None, 48)

# Load images
card_back_img = pygame.Surface((CARD_WIDTH, CARD_HEIGHT))
card_back_img.fill(GREY)

# Card class
class Card:
    def __init__(self, x, y, id):
        self.rect = pygame.Rect(x, y, CARD_WIDTH, CARD_HEIGHT)
        self.id = id
        self.is_open = False

    def draw(self, surface):
        if self.is_open:
            surface.blit(card_front_img, self.rect.topleft)
            # Draw the number
            number_text = font.render(str(self.id), True, TEXT_COLOR)
            number_rect = number_text.get_rect(center=self.rect.center)
            surface.blit(number_text, number_rect)
        else:
            surface.blit(card_back_img, self.rect.topleft)

# Initialize game window
window = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
pygame.display.set_caption("Card Flipping Game")

# Create card front image with the number
card_front_img = pygame.Surface((CARD_WIDTH, CARD_HEIGHT))
card_front_img.fill(WHITE)  # Background of card front

def create_cards():
    ids = list(range(8)) * 2
    random.shuffle(ids)
    cards = []
    for i in range(GRID_SIZE):
        for j in range(GRID_SIZE):
            x = j * (CARD_WIDTH + 10) + 10
            y = i * (CARD_HEIGHT + 10) + 10
            card = Card(x, y, ids.pop())
            cards.append(card)
    return cards

def main():
    cards = create_cards()
    clock = pygame.time.Clock()
    first_card = None
    second_card = None
    matches = 0

    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

            if event.type == pygame.MOUSEBUTTONDOWN:
                x, y = event.pos
                for card in cards:
                    if card.rect.collidepoint(x, y) and not card.is_open:
                        if first_card is None:
                            first_card = card
                            card.is_open = True
                        elif second_card is None:
                            second_card = card
                            card.is_open = True

        # Check for match
        if first_card and second_card:
            if first_card.id == second_card.id:
                matches += 1
                first_card = None
                second_card = None
                if matches == len(cards) // 2:
                    print("You won!")
                    pygame.quit()
                    sys.exit()
            else:
                pygame.time.wait(500)
                first_card.is_open = False
                second_card.is_open = False
                first_card = None
                second_card = None

        # Drawing
        window.fill(WHITE)
        for card in cards:
            card.draw(window)
        pygame.display.flip()

        clock.tick(FPS)

if __name__ == "__main__":
    main()

