def calGrade(score):
    if score>79:
        return "A"
    elif score>69:
        return "B"
    elif score>59:
        return "C"
    elif score>49:
        return "D"
    return "F"
if __name__ == "__main__":
    print("Enter Score")
    print("You Grade :",calGrade(int(input())))
    pass
