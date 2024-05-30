#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "Account.h"

class MockAccount : public Account {
public:
    MockAccount(int id, int balance) : Account(id, balance) {}
    MOCK_METHOD(int, GetBalance, (), (const, override));
    MOCK_METHOD(void, ChangeBalance, (int), (override));
    MOCK_METHOD(void, Lock, (), (override));
    MOCK_METHOD(void, Unlock, (), (override));
};

TEST(AccountTest, ChangeBalanceTest) {
    MockAccount account(1, 100);
    EXPECT_CALL(account, Lock()).Times(1);
    EXPECT_CALL(account, ChangeBalance(50)).Times(1);
    account.Lock();
    account.ChangeBalance(50);
}

TEST(AccountTest, LockUnlockTest) {
    MockAccount account(1, 100);
    EXPECT_CALL(account, Lock()).Times(1);
    EXPECT_CALL(account, Unlock()).Times(1);
    account.Lock();
    account.Unlock();
}
