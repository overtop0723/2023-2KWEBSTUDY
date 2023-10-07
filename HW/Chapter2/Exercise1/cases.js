const permutation = (n, r) => {
    var answer = 1, i;
    for (i = 0; i < r; i++) {
        answer = answer * (n - i);
    }
    return answer;
}

const combination = (n, r) => {
    var answer = 1, i;
    for (i = 0; i < r; i++) {
        answer = answer * (n - i);
        answer = answer / (i + 1);
    }
    return answer;
}

const multiPermutation = (n, r) => {return n ** r}

const multiCombination = (n, r) => {
    return combination(n + r - 1, r);
}

module.exports = {
    permutation: permutation,
    combination: combination,
    multiPermutation: multiPermutation,
    multiCombination: multiCombination,
};
