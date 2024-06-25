import (
	"math/rand"
	"time"
)

func seedRandom() *rand.Rand {
	// Generate a seed based on the current time.
	seed := time.Now().UnixNano()

	// Create and seed the random number generator.
	r := rand.New(rand.NewSource(seed))

	return r
}
