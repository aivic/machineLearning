// kMeans program based on mlpack/src/mlpack/tests/kMeans_test.cpp

#include "stdafx.h"
#include <conio.h>
#include <mlpack/core.hpp>
#include <mlpack/methods/kmeans/kmeans.hpp>
#include <mlpack/methods/kmeans/random_partition.hpp>

using namespace mlpack;
using namespace mlpack::kmeans;
using namespace mlpack::metric;
using namespace std;
void main()
{
	arma::mat kMeansData("  0.0   0.0;" // Class 1.
		"  0.3   0.4;"
		"  0.1   0.0;"
		"  0.1   0.3;"
		" -0.2  -0.2;"
		" -0.1   0.3;"
		" -0.4   0.1;"
		"  0.2  -0.1;"
		"  0.3   0.0;"
		" -0.3  -0.3;"
		"  0.1  -0.1;"
		"  0.2  -0.3;"
		" -0.3   0.2;"
		" 10.0  10.0;" // Class 2.
		" 10.1   9.9;"
		"  9.9  10.0;"
		" 10.2   9.7;"
		" 10.2   9.8;"
		"  9.7  10.3;"
		"  9.9  10.1;"
		"-10.0   5.0;" // Class 3.
		" -9.8   5.1;"
		" -9.9   4.9;"
		"-10.0   4.9;"
		"-10.2   5.2;"
		"-10.1   5.1;"
		"-10.3   5.3;"
		"-10.0   4.8;"
		" -9.6   5.0;"
		" -9.8   5.1;");

	KMeans<EuclideanDistance, RandomPartition> kmeans;

	arma::Row<size_t> assignments;
	kmeans.Cluster((arma::mat) trans(kMeansData), 3, assignments);

	_getch();
}
