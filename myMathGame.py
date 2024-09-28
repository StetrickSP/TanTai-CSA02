import random

# Generate two numbers whose tens digits add up to 10
def generate_problem():
    # Tens digits that add up to 10
    tens_pairs = [(1, 9), (2, 8), (3, 7), (4, 6), (5, 5)]

    # Randomly choose a pair whose tens digits add to 10
    tens_pair = random.choice(tens_pairs)
    
    # Form numbers with random digits in the ones place
    num1 = tens_pair[0] * 10 + random.randint(0, 9)
    num2 = tens_pair[1] * 10 + random.randint(0, 9)
    
    # Generate the multiplication question and answer
    question = f"{num1} * {num2}"
    answer = num1 * num2
    return question, answer

def math_game():
    score = 0
    total_questions = 5

    print("Welcome to the Math Game! All problems involve multiplication of two numbers where their first digits add up to 10.")
    
    for _ in range(total_questions):
        question, correct_answer = generate_problem()
        print(f"What is {question}?")
        
        # Get the player's answer
        try:
            player_answer = int(input("Your answer: "))
        except ValueError:
            print("Please enter a valid number.")
            continue
        
        # Check if the answer is correct
        if player_answer == correct_answer:
            print("Correct!")
            score += 1
        else:
            print(f"Wrong! The correct answer was {correct_answer}")
    
    # Final score display
    print(f"\nGame Over! You scored {score}/{total_questions}")

# Run the game
if __name__ == "__main__":
    math_game()
