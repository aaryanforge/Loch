from random import randint


def simulate(n_tokens=3):
    while 0 < n_tokens < 5:
        n_bet = min(5 - n_tokens, n_tokens)
        if randint(0, 2) == 0:
            n_tokens += n_bet
        else:
            n_tokens -= n_bet
    return n_tokens


n_iterations = 10000
n_success = sum(simulate() > 0 for _ in range(n_iterations))
p_success = n_success / n_iterations
print(p_success)