#include "deposit.h"
#include "ctest.h"

CTEST(InputValidation, BordersCheckPassedLeft)
{
    const int result = inputCheck(0, 0);
    const int expected = 1;
    ASSERT_EQUAL(expected, result);
}
