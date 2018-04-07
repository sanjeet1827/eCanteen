using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace eCanteen.WebApp.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            int var1 = 1, var2 = 2;
            var result = var1 + var2;
            Assert.AreEqual(3, result);
        }
    }
}
