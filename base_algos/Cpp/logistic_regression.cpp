// Logistic regression program based on mlpack/src/mlpack/tests/logistic_regression_test.cpp

#include "stdafx.h"
#include <conio.h>
#include <mlpack/core.hpp>
#include <mlpack/methods/logistic_regression/logistic_regression.hpp>

using namespace mlpack;
using namespace mlpack::regression;
using namespace std;
void main()
{
	arma::mat data("1 2 3;"
					"1 2 3");
	arma::Row<size_t> responses("1 1 0");

	// Create a LogisticRegressionFunction.
	LogisticRegressionFunction<> lrf(data, responses,
		0.0 /* no regularization */);
	lrf.Evaluate(arma::rowvec("1 1 1"));

	_getch();
}
