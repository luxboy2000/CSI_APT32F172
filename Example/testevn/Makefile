.PHONY: clean All

All:
	@echo "----------Building project:[ driver - BuildSet ]----------"
	@
	@cd "driver" && make -f "driver.mk" MakeIntermediateDirs && make -f "driver.mk" -j 6
clean:
	@echo "----------Cleaning project:[ driver - BuildSet ]----------"
	@cd "driver" && make -f  "driver.mk" clean
