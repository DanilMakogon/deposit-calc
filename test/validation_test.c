#include "deposit.h"
#include "ctest.h"

CTEST(InputValidation, BordersCheckPassedLeft)
{
    const int result = CheckInput(0, 0);
    const int expected = 0;
    ASSERT_EQUAL(expected, result);
}

