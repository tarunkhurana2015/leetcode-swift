/*
 Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.

 Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

  

 Example 1:

 Input: s = "abciiidef", k = 3
 Output: 3
 Explanation: The substring "iii" contains 3 vowel letters.
 Example 2:

 Input: s = "aeiou", k = 2
 Output: 2
 Explanation: Any substring of length 2 contains 2 vowels.
 Example 3:

 Input: s = "leetcode", k = 3
 Output: 2
 Explanation: "lee", "eet" and "ode" contain 2 vowels.
 */

func maxVowels(_ s: String, _ k: Int) -> Int {
    
    var maxCount = 0
    let vowels = "aeiou"
    
    var countVowel = 0
    for index in 0..<(s.count-k+1) { // index = 0, 1 O(n-k)
        countVowel = 0
        for subIndex in index..<(index+k) { // subIndex = 0..<3 O(k)
            let character = s[s.index(s.startIndex, offsetBy: subIndex)]
            if vowels.contains(character) {
                countVowel += 1 // 1: abc, 1: bci, 2: cii, 3: iii
            }
        }
        maxCount = max(maxCount, countVowel) // 1
        countVowel = 0
        if maxCount == k {
            break
        }
    }
    return maxCount
}

print(maxVowels("abciiidef", 3))
print(maxVowels("aeiou", 2))
print(maxVowels("leetcode", 3))
print(maxVowels("weallloveyou", 7))
print(maxVowels("wwgxitaqorexsshtznsgpyorqliarzetnlfcelqxkufminxcbnrynlehkrkgxhrcjizvryqfbjiwlgrcapmsexuakqjwcqfrhohujldftwngmornidzmfjdoqzqcfhoelqjxhqlqmsosiferoqnuthcueroacszamnxumoezelzhebljhgcllkiqoxbolxnjypumsonyndallbyxzsylkmmkpfubvtqboncjsxyokfhxftjrndmbwfjqteypegprqcwlpvvilrbhapqnieaysozktphfmcgefvsritduyzbfuksvimnkbeorqxrzrqcbfmzxndwdyqdxdwryvkrinmulujjnaydimzqxilytbvmyyocqxpvoqtrsvdmnsgmnbndwdjmnbdemuozguquqxlqpcbytlzljoewhprdhezgghgrpwmjttzypeglojexlrtfdqkhejhspetihvvospbszhgrrgehkestmrymfxxehuyrjedzhdkjwseesqlobcooemcazpuxrqavdnachtaegdxybrpigojefmsvmbcbpahnkvdgfligoyrlllmjmigpoeguaebwalogekfomzlvtqpjgnweoieeqblpewjypogmzdbhldxlcnscboqspgvnkvmnhvzgzytmkybgahzwdcsjgvdfwyszcbwvsrjvezoaxtylrpooqcdqwytiqqzdzutdsxumleyjzfnehhzsgyamfebxrqdjhsrhmvcjgzodpqnnbiyqqsalvjlyyfnsxeqzgemidcfctamqfuqvqrnthyxdxvvafgjptomfqjozleowhmjjfyujnoxiddbicixziqlqntkxpkaovkjqvzccdrnvrcitjitntvsumuwivyxsehyonfpmblfelmgfsqontkdgefocrykmfhtcvkuowxwjtbfjkfxuqrudgtfknhytrayldclzqthlpxddocwaozwexohmrxvzmjcpkpghwmfikppgjiblvxzpxlkrqvketkhvktlgvfgmrageknpnamwbdnknylgxgtmzhdkyfbvhtilcmeckkveparxmkuosayszffbxcvinmwtjieaahayazkfmmguvdjhmbytvwnxlyjadmdsywauckfxkucyquoviwmnsusktbhudjtpnkbyodsdrumvpprbuabdyzdcmqqcbvhdxuckoxeppjqtrjdhfkjslmbjmwwwjvdqsdlparnmfgksephzxslmhspeyqwiqvitekzsywieighowaoddghjmonxzoccaortbxrkikqmjodivevjduuacawgnamnhmggtdlbjpimmskfqiqbsmmimaqomjtknevslruznclnmiaiasnjqvocpyozgysduijaqgzmagxkizzopytamaoihbzrtxelpcsnfxpzyxvhcdrbpazpzomxvytghqibwgviodtywhkzjxwdgxckkyyrfrcusdwrjjilbpucudcefovnoqteqhxpsolidtbpinljwbvgijplbyfwqacwxkfssidsjewxaxkalyuuodztdrmfxdsiiujxuxddhanjdqrozjmorbatvzlfzbneuufrjhlcgwbzzjcuslbbpddumxjwmeoyfnaouzcnwprpgsvjsmqmrvmapvxuzcdxwvxkutbxwtgwhmgachgkfkzemeqsplvqbydgrpugoobqragefnhexrrspzfnphnknoipzxqsknpabircjluddkymszccjlqvnenynyriqwxgrwjnnfctaedgqndmfcyxbjotrmeqwpuiepminnlwuzinmsmkibwovxcisxmpdghkubsgemsfkincobtkwqoifofuktnvfodtvtuswvhwhxcvpeugyjspitrlpqxkesrelqtznrenkiwonyypzxaqmelmqirbvcijuzvxotuunkwqypudozpth", 44))


func maxVowels1(_ s: String, _ k: Int) -> Int {
    
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    var maxVowelCount = 0
    var currentVowelCount = 0
    let characters = Array(s)
    
    // Count vowels in the first k-length substring
    for i in 0..<k {
        if vowels.contains(characters[i]) {
            currentVowelCount += 1
        }
    }
         
    maxVowelCount = currentVowelCount
    
    // slide the window across the strings
    for i in k..<characters.count {
        if vowels.contains(characters[i]) {
            currentVowelCount += 1
        }
        if vowels.contains(characters[i-k]) {
            currentVowelCount -= 1
        }
        maxVowelCount = max(maxVowelCount, currentVowelCount)
    }
                                      
    
    return maxVowelCount
}
print(maxVowels1("wwgxitaqorexsshtznsgpyorqliarzetnlfcelqxkufminxcbnrynlehkrkgxhrcjizvryqfbjiwlgrcapmsexuakqjwcqfrhohujldftwngmornidzmfjdoqzqcfhoelqjxhqlqmsosiferoqnuthcueroacszamnxumoezelzhebljhgcllkiqoxbolxnjypumsonyndallbyxzsylkmmkpfubvtqboncjsxyokfhxftjrndmbwfjqteypegprqcwlpvvilrbhapqnieaysozktphfmcgefvsritduyzbfuksvimnkbeorqxrzrqcbfmzxndwdyqdxdwryvkrinmulujjnaydimzqxilytbvmyyocqxpvoqtrsvdmnsgmnbndwdjmnbdemuozguquqxlqpcbytlzljoewhprdhezgghgrpwmjttzypeglojexlrtfdqkhejhspetihvvospbszhgrrgehkestmrymfxxehuyrjedzhdkjwseesqlobcooemcazpuxrqavdnachtaegdxybrpigojefmsvmbcbpahnkvdgfligoyrlllmjmigpoeguaebwalogekfomzlvtqpjgnweoieeqblpewjypogmzdbhldxlcnscboqspgvnkvmnhvzgzytmkybgahzwdcsjgvdfwyszcbwvsrjvezoaxtylrpooqcdqwytiqqzdzutdsxumleyjzfnehhzsgyamfebxrqdjhsrhmvcjgzodpqnnbiyqqsalvjlyyfnsxeqzgemidcfctamqfuqvqrnthyxdxvvafgjptomfqjozleowhmjjfyujnoxiddbicixziqlqntkxpkaovkjqvzccdrnvrcitjitntvsumuwivyxsehyonfpmblfelmgfsqontkdgefocrykmfhtcvkuowxwjtbfjkfxuqrudgtfknhytrayldclzqthlpxddocwaozwexohmrxvzmjcpkpghwmfikppgjiblvxzpxlkrqvketkhvktlgvfgmrageknpnamwbdnknylgxgtmzhdkyfbvhtilcmeckkveparxmkuosayszffbxcvinmwtjieaahayazkfmmguvdjhmbytvwnxlyjadmdsywauckfxkucyquoviwmnsusktbhudjtpnkbyodsdrumvpprbuabdyzdcmqqcbvhdxuckoxeppjqtrjdhfkjslmbjmwwwjvdqsdlparnmfgksephzxslmhspeyqwiqvitekzsywieighowaoddghjmonxzoccaortbxrkikqmjodivevjduuacawgnamnhmggtdlbjpimmskfqiqbsmmimaqomjtknevslruznclnmiaiasnjqvocpyozgysduijaqgzmagxkizzopytamaoihbzrtxelpcsnfxpzyxvhcdrbpazpzomxvytghqibwgviodtywhkzjxwdgxckkyyrfrcusdwrjjilbpucudcefovnoqteqhxpsolidtbpinljwbvgijplbyfwqacwxkfssidsjewxaxkalyuuodztdrmfxdsiiujxuxddhanjdqrozjmorbatvzlfzbneuufrjhlcgwbzzjcuslbbpddumxjwmeoyfnaouzcnwprpgsvjsmqmrvmapvxuzcdxwvxkutbxwtgwhmgachgkfkzemeqsplvqbydgrpugoobqragefnhexrrspzfnphnknoipzxqsknpabircjluddkymszccjlqvnenynyriqwxgrwjnnfctaedgqndmfcyxbjotrmeqwpuiepminnlwuzinmsmkibwovxcisxmpdghkubsgemsfkincobtkwqoifofuktnvfodtvtuswvhwhxcvpeugyjspitrlpqxkesrelqtznrenkiwonyypzxaqmelmqirbvcijuzvxotuunkwqypudozpth", 44))
