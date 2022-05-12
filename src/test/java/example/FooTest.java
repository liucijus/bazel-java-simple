package example;

import org.junit.Assert;
import org.junit.Test;

public class FooTest {
    @Test
    public void fail_a_test() {
        Assert.fail();
    }

    @Test
    public void pass_a_test() {
        Assert.assertTrue(true);
    }
}
