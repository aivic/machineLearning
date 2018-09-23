// kNN program based on mlpack/src/mlpack/tests/kNN_test.cpp

#include "stdafx.h"
#include <conio.h>
#include <mlpack/core.hpp>
#include <mlpack/methods/neighbor_search/neighbor_search.hpp>

using namespace mlpack;
using namespace mlpack::neighbor;
using namespace mlpack::metric; // ManhattanDistance
using namespace std;
void main()
{
	arma::mat data("1 2 3;"
					"1 2 3");	

	NeighborSearch<NearestNeighborSort, ManhattanDistance> nn(data);
	
	arma::Mat<size_t> neighbors;
	arma::mat distances;

	nn.Search(1, neighbors, distances);

	// Print out each neighbor and its distance.
	for (size_t i = 0; i < neighbors.n_elem; ++i)
	{
		std::cout << "Nearest neighbor of point " << i << " is point "
			<< neighbors[i] << " and the distance is " << distances[i] << ".\n";
	}

	_getch();
}
