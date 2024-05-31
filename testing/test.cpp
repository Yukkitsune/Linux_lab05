#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <stdexcept>
#include <iostream>

#include "Account.h"
#include "Transaction.h"

class MAccount : public Account {
public:
    MAccount(int id, int balance) : Account(id, balance) {}
    MOCK_METHOD(int, GetBalance, (), (const, override));
    MOCK_METHOD(void, ChangeBalance, (int), (override));
    MOCK_METHOD(void, Lock, (), (override));
    MOCK_METHOD(void, Unlock, (), (override));
};

class MTransaction : public Transaction {
public:
    MTransaction() : Transaction() {}
    MOCK_METHOD(void, SaveToDataBase, (Account& from, Account& to, int sum), (override));
};

using ::testing::AtLeast;

TEST(acc, mock) {
    MAccount test(1, 100);
    EXPECT_CALL(test, GetBalance()).Times(AtLeast(1));
    std::cout << test.GetBalance() << std::endl;

    EXPECT_CALL(test, Lock()).Times(AtLeast(1));
    test.Lock();
    EXPECT_CALL(test, Unlock()).Times(AtLeast(1));
    test.Unlock();

    EXPECT_CALL(test, ChangeBalance(100)).Times(AtLeast(1));
    test.ChangeBalance(100);
}

TEST(acc, test) {
    Account dt(1, 100);

    EXPECT_EQ(100, dt.GetBalance());

    dt.Lock();
    dt.ChangeBalance(900);
    dt.Unlock();

    EXPECT_EQ(1000, dt.GetBalance());

    try {
        dt.ChangeBalance(1);
    } catch (std::runtime_error& err) {}

    EXPECT_EQ(1000, dt.GetBalance());
}

TEST(tr, mock) {
    Account dt(1, 10000);
    Account rt(2, 10000);
    MTransaction bank;

    EXPECT_CALL(bank, SaveToDataBase(testing::_, testing::_, 1999)).Times(AtLeast(1));
    bank.Make(dt, rt, 1999);
}

TEST(tr, test) {
    Account dt(1, 10000);
    Account rt(2, 10000);
    Transaction bank1;
    Transaction bank2;
    bank2.set_fee(500);
    try {
        bank1.Make(dt, rt, -100);
    } catch (std::invalid_argument& err) {}

    try {
        bank1.Make(dt, rt, 0);
    } catch (std::logic_error& err) {}

    EXPECT_EQ(false, bank2.Make(dt, rt, 200));
    bank1.Make(dt, rt, 1999);

    EXPECT_EQ(dt.GetBalance(), 10000);
    EXPECT_EQ(rt.GetBalance(), 9999);
