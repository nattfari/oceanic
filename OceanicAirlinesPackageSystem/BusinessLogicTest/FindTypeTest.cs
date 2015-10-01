using System;
using System.Collections.Generic;
using System.Linq;
using BusinessLogic.Managers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BusinessLogicTest
{
    [TestClass]
    public class FindTypeTest
    {
        private CalculationManager _calculationManager;
        [TestInitialize]
        public void Setup()
        {
            _calculationManager = new CalculationManager();
        }

        [TestMethod]
        public void TestFindType_1_1_1()
        {
            var type = _calculationManager.FindType(1, 1, 1);
            var result = type.SequenceEqual(new List<string>() { "a", "b", "c", "d", "e" });
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestFindType_100_1_1()
        {
            var type = _calculationManager.FindType(100, 1, 1);
            var result = type.SequenceEqual(new List<string>() { "c" });
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestFindType_1_100_1()
        {
            var type = _calculationManager.FindType(1, 100, 1);
            var result = type.SequenceEqual(new List<string>() {"c"});
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestFindType_100_100_1()
        {
            var type = _calculationManager.FindType(100, 100, 1);
            var result = type.SequenceEqual(new List<string>());
            Assert.IsTrue(result);
        }
    }
}
