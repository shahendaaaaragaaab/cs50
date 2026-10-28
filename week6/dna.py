import csv
import sys


def main():
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        sys.exit(1)

    database_filename = sys.argv[1]
    sequence_filename = sys.argv[2]

    rows = []
    with open(database_filename, "r") as file:
        reader = csv.DictReader(file)
        strs = reader.fieldnames[1:]
        for row in reader:
            rows.append(row)

    with open(sequence_filename, "r") as file:
        dna_sequence = file.read()

    result = {}
    for str_name in strs:
        result[str_name] = longest_match(dna_sequence, str_name)

    for person in rows:
        match = True
        for str_name in strs:
            if int(person[str_name]) != result[str_name]:
                match = False
                break

        if match:
            print(person["name"])
            return

    print("No match")


def longest_match(sequence, subsequence):
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    for i in range(sequence_length):
        count = 0

        while True:
            start = i + count * subsequence_length
            end = start + subsequence_length

            if sequence[start:end] == subsequence:
                count += 1
            else:
                break

        longest_run = max(longest_run, count)

    return longest_run


if __name__ == "__main__":
    main()
