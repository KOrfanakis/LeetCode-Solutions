# LeetCode 1672. Richest Customer Wealth
# https://leetcode.com/problems/richest-customer-wealth/


# Solution #01: Row Sum Maximum

class Solution(object):
    def maximumWealth(self, accounts):
        """
        :type accounts: List[List[int]]
        :rtype: int
        """
        
        # Initialize the maximum wealth to 0
        max_wealth = 0

        # Iterate over all customers
        for cust_accounts in accounts:
            # Add the money in each bank for each customer
            cust_wealth = sum(cust_accounts)
            # Update the maximum wealth if the current customer's wealth is greater
            if cust_wealth > max_wealth:
                max_wealth = cust_wealth

        # Return the maximum wealth
        return max_wealth


# Solution #02: Using a One-Liner

class Solution(object):
    def maximumWealth(self, accounts):
        """
        :type accounts: List[List[int]]
        :rtype: int
        """
        
        return max(list(map(sum, accounts)))


# accounts = [[1,2,3],[3,2,1]]
# accounts = [[1,5],[7,3],[3,5]]
# accounts = [[2,8,7],[7,1,3],[1,9,5]]

# s = Solution()
# print(s.maximumWealth(accounts))