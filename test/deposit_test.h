#include "deposit.h"
#include "ctest.h"

CTEST(PenaltyTest, penaltyAppliedTenPercentOK)
{
    const int result = perform(20, 1000);
    const int expected = 900;
    ASSERT_EQUAL(expected, result);
}
